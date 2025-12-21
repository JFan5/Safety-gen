(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v6)
		(pred_4 ?v1)
		(pred_2 ?v5)
		(pred_6 ?v5)
		(pred_1 ?v1 ?v5)
		(pred_5)
		(pred_3 ?v1))

   (:action op_3
       :parameters  (?v7 ?v8)
       :precondition (and (not-eq ?v7 ?v8) 
                          (pred_2 ?v7) (pred_2 ?v8) (pred_6 ?v7))
       :effect (and  (pred_6 ?v8)
		     (not (pred_6 ?v7))))


   (:action op_1
       :parameters (?v4 ?v3)
       :precondition  (and  (pred_4 ?v4) (pred_2 ?v3)
			    (pred_1 ?v4 ?v3) (pred_6 ?v3) (pred_5))
       :effect (and (pred_3 ?v4)
		    (not (pred_1 ?v4 ?v3)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v4  ?v3)
       :precondition  (and  (pred_4 ?v4) (pred_2 ?v3)
			    (pred_3 ?v4) (pred_6 ?v3))
       :effect (and (pred_1 ?v4 ?v3)
		    (pred_5)
		    (not (pred_3 ?v4)))))
