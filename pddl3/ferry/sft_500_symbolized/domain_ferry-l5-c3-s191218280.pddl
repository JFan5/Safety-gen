(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v2)
		(pred_3 ?v8)
		(pred_5 ?v4)
		(pred_1 ?v4)
		(pred_6 ?v8 ?v4)
		(pred_4)
		(pred_2 ?v8))

   (:action op_2
       :parameters  (?v6 ?v1)
       :precondition (and (not-eq ?v6 ?v1) 
                          (pred_5 ?v6) (pred_5 ?v1) (pred_1 ?v6))
       :effect (and  (pred_1 ?v1)
		     (not (pred_1 ?v6))))


   (:action op_3
       :parameters (?v5 ?v7)
       :precondition  (and  (pred_3 ?v5) (pred_5 ?v7)
			    (pred_6 ?v5 ?v7) (pred_1 ?v7) (pred_4))
       :effect (and (pred_2 ?v5)
		    (not (pred_6 ?v5 ?v7)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v5  ?v7)
       :precondition  (and  (pred_3 ?v5) (pred_5 ?v7)
			    (pred_2 ?v5) (pred_1 ?v7))
       :effect (and (pred_6 ?v5 ?v7)
		    (pred_4)
		    (not (pred_2 ?v5)))))
