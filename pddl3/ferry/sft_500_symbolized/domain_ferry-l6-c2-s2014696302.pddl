(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v4)
		(pred_4 ?v2)
		(pred_1 ?v3)
		(pred_6 ?v3)
		(pred_2 ?v2 ?v3)
		(pred_5)
		(pred_3 ?v2))

   (:action op_2
       :parameters  (?v6 ?v8)
       :precondition (and (not-eq ?v6 ?v8) 
                          (pred_1 ?v6) (pred_1 ?v8) (pred_6 ?v6))
       :effect (and  (pred_6 ?v8)
		     (not (pred_6 ?v6))))


   (:action op_3
       :parameters (?v1 ?v7)
       :precondition  (and  (pred_4 ?v1) (pred_1 ?v7)
			    (pred_2 ?v1 ?v7) (pred_6 ?v7) (pred_5))
       :effect (and (pred_3 ?v1)
		    (not (pred_2 ?v1 ?v7)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v1  ?v7)
       :precondition  (and  (pred_4 ?v1) (pred_1 ?v7)
			    (pred_3 ?v1) (pred_6 ?v7))
       :effect (and (pred_2 ?v1 ?v7)
		    (pred_5)
		    (not (pred_3 ?v1)))))
