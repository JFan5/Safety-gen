(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v5)
		(pred_1 ?v7)
		(pred_3 ?v4)
		(pred_4 ?v4)
		(pred_5 ?v7 ?v4)
		(pred_2)
		(pred_6 ?v7))

   (:action op_2
       :parameters  (?v6 ?v2)
       :precondition (and (not-eq ?v6 ?v2) 
                          (pred_3 ?v6) (pred_3 ?v2) (pred_4 ?v6))
       :effect (and  (pred_4 ?v2)
		     (not (pred_4 ?v6))))


   (:action op_3
       :parameters (?v3 ?v8)
       :precondition  (and  (pred_1 ?v3) (pred_3 ?v8)
			    (pred_5 ?v3 ?v8) (pred_4 ?v8) (pred_2))
       :effect (and (pred_6 ?v3)
		    (not (pred_5 ?v3 ?v8)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v3  ?v8)
       :precondition  (and  (pred_1 ?v3) (pred_3 ?v8)
			    (pred_6 ?v3) (pred_4 ?v8))
       :effect (and (pred_5 ?v3 ?v8)
		    (pred_2)
		    (not (pred_6 ?v3)))))
