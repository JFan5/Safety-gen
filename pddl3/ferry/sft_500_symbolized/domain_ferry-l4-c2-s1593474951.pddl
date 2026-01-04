(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v6)
		(pred_2 ?v3)
		(pred_4 ?v5)
		(pred_6 ?v5)
		(pred_3 ?v3 ?v5)
		(pred_1)
		(pred_5 ?v3))

   (:action op_1
       :parameters  (?v7 ?v8)
       :precondition (and (not-eq ?v7 ?v8) 
                          (pred_4 ?v7) (pred_4 ?v8) (pred_6 ?v7))
       :effect (and  (pred_6 ?v8)
		     (not (pred_6 ?v7))))


   (:action op_3
       :parameters (?v4 ?v1)
       :precondition  (and  (pred_2 ?v4) (pred_4 ?v1)
			    (pred_3 ?v4 ?v1) (pred_6 ?v1) (pred_1))
       :effect (and (pred_5 ?v4)
		    (not (pred_3 ?v4 ?v1)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v4  ?v1)
       :precondition  (and  (pred_2 ?v4) (pred_4 ?v1)
			    (pred_5 ?v4) (pred_6 ?v1))
       :effect (and (pred_3 ?v4 ?v1)
		    (pred_1)
		    (not (pred_5 ?v4)))))
