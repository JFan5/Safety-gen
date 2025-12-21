(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v1)
		(pred_6 ?v2)
		(pred_2 ?v3)
		(pred_1 ?v3)
		(pred_4 ?v2 ?v3)
		(pred_5)
		(pred_3 ?v2))

   (:action op_2
       :parameters  (?v5 ?v8)
       :precondition (and (not-eq ?v5 ?v8) 
                          (pred_2 ?v5) (pred_2 ?v8) (pred_1 ?v5))
       :effect (and  (pred_1 ?v8)
		     (not (pred_1 ?v5))))


   (:action op_1
       :parameters (?v4 ?v7)
       :precondition  (and  (pred_6 ?v4) (pred_2 ?v7)
			    (pred_4 ?v4 ?v7) (pred_1 ?v7) (pred_5))
       :effect (and (pred_3 ?v4)
		    (not (pred_4 ?v4 ?v7)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v4  ?v7)
       :precondition  (and  (pred_6 ?v4) (pred_2 ?v7)
			    (pred_3 ?v4) (pred_1 ?v7))
       :effect (and (pred_4 ?v4 ?v7)
		    (pred_5)
		    (not (pred_3 ?v4)))))
