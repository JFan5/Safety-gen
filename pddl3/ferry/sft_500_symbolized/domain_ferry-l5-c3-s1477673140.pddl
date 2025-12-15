(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_2 ?v6)
		(pred_1 ?v4)
		(pred_4 ?v4)
		(pred_6 ?v6 ?v4)
		(pred_3)
		(pred_5 ?v6))

   (:action op_1
       :parameters  (?v7 ?v5)
       :precondition (and (not-eq ?v7 ?v5) 
                          (pred_1 ?v7) (pred_1 ?v5) (pred_4 ?v7))
       :effect (and  (pred_4 ?v5)
		     (not (pred_4 ?v7))))


   (:action op_3
       :parameters (?v8 ?v3)
       :precondition  (and  (pred_2 ?v8) (pred_1 ?v3)
			    (pred_6 ?v8 ?v3) (pred_4 ?v3) (pred_3))
       :effect (and (pred_5 ?v8)
		    (not (pred_6 ?v8 ?v3)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v8  ?v3)
       :precondition  (and  (pred_2 ?v8) (pred_1 ?v3)
			    (pred_5 ?v8) (pred_4 ?v3))
       :effect (and (pred_6 ?v8 ?v3)
		    (pred_3)
		    (not (pred_5 ?v8)))))
