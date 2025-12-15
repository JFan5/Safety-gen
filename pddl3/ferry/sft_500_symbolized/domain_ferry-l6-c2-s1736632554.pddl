(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v4)
		(pred_4 ?v1)
		(pred_6 ?v8)
		(pred_3 ?v8)
		(pred_1 ?v1 ?v8)
		(pred_2)
		(pred_5 ?v1))

   (:action op_1
       :parameters  (?v5 ?v7)
       :precondition (and (not-eq ?v5 ?v7) 
                          (pred_6 ?v5) (pred_6 ?v7) (pred_3 ?v5))
       :effect (and  (pred_3 ?v7)
		     (not (pred_3 ?v5))))


   (:action op_3
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_4 ?v6) (pred_6 ?v2)
			    (pred_1 ?v6 ?v2) (pred_3 ?v2) (pred_2))
       :effect (and (pred_5 ?v6)
		    (not (pred_1 ?v6 ?v2)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_4 ?v6) (pred_6 ?v2)
			    (pred_5 ?v6) (pred_3 ?v2))
       :effect (and (pred_1 ?v6 ?v2)
		    (pred_2)
		    (not (pred_5 ?v6)))))
