(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v6)
		(pred_1 ?v3)
		(pred_3 ?v4)
		(pred_4 ?v4)
		(pred_2 ?v3 ?v4)
		(pred_5)
		(pred_6 ?v3))

   (:action op_3
       :parameters  (?v5 ?v8)
       :precondition (and (not-eq ?v5 ?v8) 
                          (pred_3 ?v5) (pred_3 ?v8) (pred_4 ?v5))
       :effect (and  (pred_4 ?v8)
		     (not (pred_4 ?v5))))


   (:action op_2
       :parameters (?v1 ?v7)
       :precondition  (and  (pred_1 ?v1) (pred_3 ?v7)
			    (pred_2 ?v1 ?v7) (pred_4 ?v7) (pred_5))
       :effect (and (pred_6 ?v1)
		    (not (pred_2 ?v1 ?v7)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v1  ?v7)
       :precondition  (and  (pred_1 ?v1) (pred_3 ?v7)
			    (pred_6 ?v1) (pred_4 ?v7))
       :effect (and (pred_2 ?v1 ?v7)
		    (pred_5)
		    (not (pred_6 ?v1)))))
