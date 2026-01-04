(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v4)
		(pred_3 ?v1)
		(pred_1 ?v2)
		(pred_2 ?v2)
		(pred_4 ?v1 ?v2)
		(pred_5)
		(pred_6 ?v1))

   (:action op_2
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_1 ?v6) (pred_1 ?v5) (pred_2 ?v6))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v6))))


   (:action op_3
       :parameters (?v7 ?v3)
       :precondition  (and  (pred_3 ?v7) (pred_1 ?v3)
			    (pred_4 ?v7 ?v3) (pred_2 ?v3) (pred_5))
       :effect (and (pred_6 ?v7)
		    (not (pred_4 ?v7 ?v3)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v7  ?v3)
       :precondition  (and  (pred_3 ?v7) (pred_1 ?v3)
			    (pred_6 ?v7) (pred_2 ?v3))
       :effect (and (pred_4 ?v7 ?v3)
		    (pred_5)
		    (not (pred_6 ?v7)))))
