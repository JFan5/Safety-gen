(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v2)
		(pred_1 ?v5)
		(pred_2 ?v3)
		(pred_6 ?v3)
		(pred_5 ?v5 ?v3)
		(pred_3)
		(pred_4 ?v5))

   (:action op_3
       :parameters  (?v6 ?v7)
       :precondition (and (not-eq ?v6 ?v7) 
                          (pred_2 ?v6) (pred_2 ?v7) (pred_6 ?v6))
       :effect (and  (pred_6 ?v7)
		     (not (pred_6 ?v6))))


   (:action op_2
       :parameters (?v1 ?v4)
       :precondition  (and  (pred_1 ?v1) (pred_2 ?v4)
			    (pred_5 ?v1 ?v4) (pred_6 ?v4) (pred_3))
       :effect (and (pred_4 ?v1)
		    (not (pred_5 ?v1 ?v4)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v1  ?v4)
       :precondition  (and  (pred_1 ?v1) (pred_2 ?v4)
			    (pred_4 ?v1) (pred_6 ?v4))
       :effect (and (pred_5 ?v1 ?v4)
		    (pred_3)
		    (not (pred_4 ?v1)))))
