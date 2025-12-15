(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v2)
		(pred_6 ?v4)
		(pred_5 ?v8)
		(pred_2 ?v8)
		(pred_1 ?v4 ?v8)
		(pred_4)
		(pred_3 ?v4))

   (:action op_2
       :parameters  (?v6 ?v5)
       :precondition (and (not-eq ?v6 ?v5) 
                          (pred_5 ?v6) (pred_5 ?v5) (pred_2 ?v6))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v6))))


   (:action op_1
       :parameters (?v1 ?v7)
       :precondition  (and  (pred_6 ?v1) (pred_5 ?v7)
			    (pred_1 ?v1 ?v7) (pred_2 ?v7) (pred_4))
       :effect (and (pred_3 ?v1)
		    (not (pred_1 ?v1 ?v7)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v1  ?v7)
       :precondition  (and  (pred_6 ?v1) (pred_5 ?v7)
			    (pred_3 ?v1) (pred_2 ?v7))
       :effect (and (pred_1 ?v1 ?v7)
		    (pred_4)
		    (not (pred_3 ?v1)))))
