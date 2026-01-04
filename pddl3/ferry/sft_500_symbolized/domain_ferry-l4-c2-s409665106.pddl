(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_6 ?v1)
		(pred_1 ?v6)
		(pred_2 ?v6)
		(pred_4 ?v1 ?v6)
		(pred_5)
		(pred_3 ?v1))

   (:action op_3
       :parameters  (?v5 ?v7)
       :precondition (and (not-eq ?v5 ?v7) 
                          (pred_1 ?v5) (pred_1 ?v7) (pred_2 ?v5))
       :effect (and  (pred_2 ?v7)
		     (not (pred_2 ?v5))))


   (:action op_1
       :parameters (?v2 ?v4)
       :precondition  (and  (pred_6 ?v2) (pred_1 ?v4)
			    (pred_4 ?v2 ?v4) (pred_2 ?v4) (pred_5))
       :effect (and (pred_3 ?v2)
		    (not (pred_4 ?v2 ?v4)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v2  ?v4)
       :precondition  (and  (pred_6 ?v2) (pred_1 ?v4)
			    (pred_3 ?v2) (pred_2 ?v4))
       :effect (and (pred_4 ?v2 ?v4)
		    (pred_5)
		    (not (pred_3 ?v2)))))
