(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v1)
		(pred_4 ?v3)
		(pred_2 ?v2)
		(pred_6 ?v2)
		(pred_1 ?v3 ?v2)
		(pred_3)
		(pred_5 ?v3))

   (:action op_3
       :parameters  (?v7 ?v4)
       :precondition (and (not-eq ?v7 ?v4) 
                          (pred_2 ?v7) (pred_2 ?v4) (pred_6 ?v7))
       :effect (and  (pred_6 ?v4)
		     (not (pred_6 ?v7))))


   (:action op_2
       :parameters (?v8 ?v5)
       :precondition  (and  (pred_4 ?v8) (pred_2 ?v5)
			    (pred_1 ?v8 ?v5) (pred_6 ?v5) (pred_3))
       :effect (and (pred_5 ?v8)
		    (not (pred_1 ?v8 ?v5)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v8  ?v5)
       :precondition  (and  (pred_4 ?v8) (pred_2 ?v5)
			    (pred_5 ?v8) (pred_6 ?v5))
       :effect (and (pred_1 ?v8 ?v5)
		    (pred_3)
		    (not (pred_5 ?v8)))))
