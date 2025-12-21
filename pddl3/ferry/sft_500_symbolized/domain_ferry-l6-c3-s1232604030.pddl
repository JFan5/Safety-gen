(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v1)
		(pred_4 ?v8)
		(pred_5 ?v2)
		(pred_2 ?v2)
		(pred_1 ?v8 ?v2)
		(pred_6)
		(pred_3 ?v8))

   (:action op_3
       :parameters  (?v7 ?v6)
       :precondition (and (not-eq ?v7 ?v6) 
                          (pred_5 ?v7) (pred_5 ?v6) (pred_2 ?v7))
       :effect (and  (pred_2 ?v6)
		     (not (pred_2 ?v7))))


   (:action op_2
       :parameters (?v5 ?v3)
       :precondition  (and  (pred_4 ?v5) (pred_5 ?v3)
			    (pred_1 ?v5 ?v3) (pred_2 ?v3) (pred_6))
       :effect (and (pred_3 ?v5)
		    (not (pred_1 ?v5 ?v3)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v5  ?v3)
       :precondition  (and  (pred_4 ?v5) (pred_5 ?v3)
			    (pred_3 ?v5) (pred_2 ?v3))
       :effect (and (pred_1 ?v5 ?v3)
		    (pred_6)
		    (not (pred_3 ?v5)))))
