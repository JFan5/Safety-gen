(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v6)
		(pred_3 ?v4)
		(pred_6 ?v2)
		(pred_1 ?v2)
		(pred_5 ?v4 ?v2)
		(pred_4)
		(pred_2 ?v4))

   (:action op_3
       :parameters  (?v3 ?v5)
       :precondition (and (not-eq ?v3 ?v5) 
                          (pred_6 ?v3) (pred_6 ?v5) (pred_1 ?v3))
       :effect (and  (pred_1 ?v5)
		     (not (pred_1 ?v3))))


   (:action op_2
       :parameters (?v7 ?v8)
       :precondition  (and  (pred_3 ?v7) (pred_6 ?v8)
			    (pred_5 ?v7 ?v8) (pred_1 ?v8) (pred_4))
       :effect (and (pred_2 ?v7)
		    (not (pred_5 ?v7 ?v8)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v7  ?v8)
       :precondition  (and  (pred_3 ?v7) (pred_6 ?v8)
			    (pred_2 ?v7) (pred_1 ?v8))
       :effect (and (pred_5 ?v7 ?v8)
		    (pred_4)
		    (not (pred_2 ?v7)))))
