(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_5 ?v7)
		(pred_4 ?v6)
		(pred_2 ?v6)
		(pred_1 ?v7 ?v6)
		(pred_3)
		(pred_6 ?v7))

   (:action op_3
       :parameters  (?v3 ?v5)
       :precondition (and (not-eq ?v3 ?v5) 
                          (pred_4 ?v3) (pred_4 ?v5) (pred_2 ?v3))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v3))))


   (:action op_1
       :parameters (?v4 ?v8)
       :precondition  (and  (pred_5 ?v4) (pred_4 ?v8)
			    (pred_1 ?v4 ?v8) (pred_2 ?v8) (pred_3))
       :effect (and (pred_6 ?v4)
		    (not (pred_1 ?v4 ?v8)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v4  ?v8)
       :precondition  (and  (pred_5 ?v4) (pred_4 ?v8)
			    (pred_6 ?v4) (pred_2 ?v8))
       :effect (and (pred_1 ?v4 ?v8)
		    (pred_3)
		    (not (pred_6 ?v4)))))
