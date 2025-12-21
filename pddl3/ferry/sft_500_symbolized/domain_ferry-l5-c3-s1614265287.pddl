(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v1)
		(pred_5 ?v2)
		(pred_2 ?v3)
		(pred_1 ?v3)
		(pred_3 ?v2 ?v3)
		(pred_6)
		(pred_4 ?v2))

   (:action op_3
       :parameters  (?v7 ?v8)
       :precondition (and (not-eq ?v7 ?v8) 
                          (pred_2 ?v7) (pred_2 ?v8) (pred_1 ?v7))
       :effect (and  (pred_1 ?v8)
		     (not (pred_1 ?v7))))


   (:action op_1
       :parameters (?v4 ?v5)
       :precondition  (and  (pred_5 ?v4) (pred_2 ?v5)
			    (pred_3 ?v4 ?v5) (pred_1 ?v5) (pred_6))
       :effect (and (pred_4 ?v4)
		    (not (pred_3 ?v4 ?v5)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v4  ?v5)
       :precondition  (and  (pred_5 ?v4) (pred_2 ?v5)
			    (pred_4 ?v4) (pred_1 ?v5))
       :effect (and (pred_3 ?v4 ?v5)
		    (pred_6)
		    (not (pred_4 ?v4)))))
