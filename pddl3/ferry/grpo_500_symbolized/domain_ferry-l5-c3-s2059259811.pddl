(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v4)
		(pred_4 ?v5)
		(pred_5 ?v6)
		(pred_1 ?v6)
		(pred_6 ?v5 ?v6)
		(pred_2)
		(pred_3 ?v5))

   (:action op_3
       :parameters  (?v2 ?v8)
       :precondition (and (not-eq ?v2 ?v8) 
                          (pred_5 ?v2) (pred_5 ?v8) (pred_1 ?v2))
       :effect (and  (pred_1 ?v8)
		     (not (pred_1 ?v2))))


   (:action op_1
       :parameters (?v3 ?v7)
       :precondition  (and  (pred_4 ?v3) (pred_5 ?v7)
			    (pred_6 ?v3 ?v7) (pred_1 ?v7) (pred_2))
       :effect (and (pred_3 ?v3)
		    (not (pred_6 ?v3 ?v7)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v3  ?v7)
       :precondition  (and  (pred_4 ?v3) (pred_5 ?v7)
			    (pred_3 ?v3) (pred_1 ?v7))
       :effect (and (pred_6 ?v3 ?v7)
		    (pred_2)
		    (not (pred_3 ?v3)))))
