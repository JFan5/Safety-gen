(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_3 ?v2)
		(pred_1 ?v4)
		(pred_4 ?v4)
		(pred_2 ?v2 ?v4)
		(pred_6)
		(pred_5 ?v2))

   (:action op_2
       :parameters  (?v7 ?v6)
       :precondition (and (not-eq ?v7 ?v6) 
                          (pred_1 ?v7) (pred_1 ?v6) (pred_4 ?v7))
       :effect (and  (pred_4 ?v6)
		     (not (pred_4 ?v7))))


   (:action op_1
       :parameters (?v3 ?v5)
       :precondition  (and  (pred_3 ?v3) (pred_1 ?v5)
			    (pred_2 ?v3 ?v5) (pred_4 ?v5) (pred_6))
       :effect (and (pred_5 ?v3)
		    (not (pred_2 ?v3 ?v5)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v3  ?v5)
       :precondition  (and  (pred_3 ?v3) (pred_1 ?v5)
			    (pred_5 ?v3) (pred_4 ?v5))
       :effect (and (pred_2 ?v3 ?v5)
		    (pred_6)
		    (not (pred_5 ?v3)))))
