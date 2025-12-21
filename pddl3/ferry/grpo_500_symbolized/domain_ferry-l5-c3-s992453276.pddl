(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_3 ?v5)
		(pred_1 ?v1)
		(pred_2 ?v1)
		(pred_4 ?v5 ?v1)
		(pred_6)
		(pred_5 ?v5))

   (:action op_2
       :parameters  (?v4 ?v6)
       :precondition (and (not-eq ?v4 ?v6) 
                          (pred_1 ?v4) (pred_1 ?v6) (pred_2 ?v4))
       :effect (and  (pred_2 ?v6)
		     (not (pred_2 ?v4))))


   (:action op_3
       :parameters (?v2 ?v7)
       :precondition  (and  (pred_3 ?v2) (pred_1 ?v7)
			    (pred_4 ?v2 ?v7) (pred_2 ?v7) (pred_6))
       :effect (and (pred_5 ?v2)
		    (not (pred_4 ?v2 ?v7)) 
		    (not (pred_6))))

   (:action op_1
       :parameters  (?v2  ?v7)
       :precondition  (and  (pred_3 ?v2) (pred_1 ?v7)
			    (pred_5 ?v2) (pred_2 ?v7))
       :effect (and (pred_4 ?v2 ?v7)
		    (pred_6)
		    (not (pred_5 ?v2)))))
