(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v1)
		(pred_4 ?v4)
		(pred_1 ?v6)
		(pred_6 ?v6)
		(pred_3 ?v4 ?v6)
		(pred_5)
		(pred_2 ?v4))

   (:action op_3
       :parameters  (?v7 ?v2)
       :precondition (and (not-eq ?v7 ?v2) 
                          (pred_1 ?v7) (pred_1 ?v2) (pred_6 ?v7))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v7))))


   (:action op_2
       :parameters (?v8 ?v3)
       :precondition  (and  (pred_4 ?v8) (pred_1 ?v3)
			    (pred_3 ?v8 ?v3) (pred_6 ?v3) (pred_5))
       :effect (and (pred_2 ?v8)
		    (not (pred_3 ?v8 ?v3)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v8  ?v3)
       :precondition  (and  (pred_4 ?v8) (pred_1 ?v3)
			    (pred_2 ?v8) (pred_6 ?v3))
       :effect (and (pred_3 ?v8 ?v3)
		    (pred_5)
		    (not (pred_2 ?v8)))))
