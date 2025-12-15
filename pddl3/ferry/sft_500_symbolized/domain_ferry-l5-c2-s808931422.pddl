(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v3)
		(pred_4 ?v7)
		(pred_2 ?v8)
		(pred_1 ?v8)
		(pred_6 ?v7 ?v8)
		(pred_5)
		(pred_3 ?v7))

   (:action op_3
       :parameters  (?v1 ?v2)
       :precondition (and (not-eq ?v1 ?v2) 
                          (pred_2 ?v1) (pred_2 ?v2) (pred_1 ?v1))
       :effect (and  (pred_1 ?v2)
		     (not (pred_1 ?v1))))


   (:action op_1
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_4 ?v6) (pred_2 ?v4)
			    (pred_6 ?v6 ?v4) (pred_1 ?v4) (pred_5))
       :effect (and (pred_3 ?v6)
		    (not (pred_6 ?v6 ?v4)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_4 ?v6) (pred_2 ?v4)
			    (pred_3 ?v6) (pred_1 ?v4))
       :effect (and (pred_6 ?v6 ?v4)
		    (pred_5)
		    (not (pred_3 ?v6)))))
