(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v3)
		(pred_3 ?v1)
		(pred_2 ?v5)
		(pred_1 ?v5)
		(pred_4 ?v1 ?v5)
		(pred_5)
		(pred_6 ?v1))

   (:action op_2
       :parameters  (?v2 ?v8)
       :precondition (and (not-eq ?v2 ?v8) 
                          (pred_2 ?v2) (pred_2 ?v8) (pred_1 ?v2))
       :effect (and  (pred_1 ?v8)
		     (not (pred_1 ?v2))))


   (:action op_1
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_3 ?v6) (pred_2 ?v7)
			    (pred_4 ?v6 ?v7) (pred_1 ?v7) (pred_5))
       :effect (and (pred_6 ?v6)
		    (not (pred_4 ?v6 ?v7)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_3 ?v6) (pred_2 ?v7)
			    (pred_6 ?v6) (pred_1 ?v7))
       :effect (and (pred_4 ?v6 ?v7)
		    (pred_5)
		    (not (pred_6 ?v6)))))
