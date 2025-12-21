(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v3)
		(pred_4 ?v6)
		(pred_1 ?v7)
		(pred_2 ?v7)
		(pred_6 ?v6 ?v7)
		(pred_5)
		(pred_3 ?v6))

   (:action op_3
       :parameters  (?v5 ?v4)
       :precondition (and (not-eq ?v5 ?v4) 
                          (pred_1 ?v5) (pred_1 ?v4) (pred_2 ?v5))
       :effect (and  (pred_2 ?v4)
		     (not (pred_2 ?v5))))


   (:action op_2
       :parameters (?v8 ?v1)
       :precondition  (and  (pred_4 ?v8) (pred_1 ?v1)
			    (pred_6 ?v8 ?v1) (pred_2 ?v1) (pred_5))
       :effect (and (pred_3 ?v8)
		    (not (pred_6 ?v8 ?v1)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v8  ?v1)
       :precondition  (and  (pred_4 ?v8) (pred_1 ?v1)
			    (pred_3 ?v8) (pred_2 ?v1))
       :effect (and (pred_6 ?v8 ?v1)
		    (pred_5)
		    (not (pred_3 ?v8)))))
