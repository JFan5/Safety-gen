(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v2)
		(pred_4 ?v3)
		(pred_1 ?v6)
		(pred_3 ?v6)
		(pred_2 ?v3 ?v6)
		(pred_6)
		(pred_5 ?v3))

   (:action op_1
       :parameters  (?v4 ?v5)
       :precondition (and (not-eq ?v4 ?v5) 
                          (pred_1 ?v4) (pred_1 ?v5) (pred_3 ?v4))
       :effect (and  (pred_3 ?v5)
		     (not (pred_3 ?v4))))


   (:action op_3
       :parameters (?v1 ?v7)
       :precondition  (and  (pred_4 ?v1) (pred_1 ?v7)
			    (pred_2 ?v1 ?v7) (pred_3 ?v7) (pred_6))
       :effect (and (pred_5 ?v1)
		    (not (pred_2 ?v1 ?v7)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v1  ?v7)
       :precondition  (and  (pred_4 ?v1) (pred_1 ?v7)
			    (pred_5 ?v1) (pred_3 ?v7))
       :effect (and (pred_2 ?v1 ?v7)
		    (pred_6)
		    (not (pred_5 ?v1)))))
