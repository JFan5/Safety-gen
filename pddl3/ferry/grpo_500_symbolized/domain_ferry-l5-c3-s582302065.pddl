(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v6)
		(pred_3 ?v7)
		(pred_1 ?v2)
		(pred_2 ?v2)
		(pred_5 ?v7 ?v2)
		(pred_4)
		(pred_6 ?v7))

   (:action op_1
       :parameters  (?v1 ?v3)
       :precondition (and (not-eq ?v1 ?v3) 
                          (pred_1 ?v1) (pred_1 ?v3) (pred_2 ?v1))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v1))))


   (:action op_2
       :parameters (?v5 ?v8)
       :precondition  (and  (pred_3 ?v5) (pred_1 ?v8)
			    (pred_5 ?v5 ?v8) (pred_2 ?v8) (pred_4))
       :effect (and (pred_6 ?v5)
		    (not (pred_5 ?v5 ?v8)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v5  ?v8)
       :precondition  (and  (pred_3 ?v5) (pred_1 ?v8)
			    (pred_6 ?v5) (pred_2 ?v8))
       :effect (and (pred_5 ?v5 ?v8)
		    (pred_4)
		    (not (pred_6 ?v5)))))
