(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v1)
		(pred_2 ?v8)
		(pred_4 ?v6)
		(pred_3 ?v6)
		(pred_5 ?v8 ?v6)
		(pred_1)
		(pred_6 ?v8))

   (:action op_2
       :parameters  (?v7 ?v4)
       :precondition (and (not-eq ?v7 ?v4) 
                          (pred_4 ?v7) (pred_4 ?v4) (pred_3 ?v7))
       :effect (and  (pred_3 ?v4)
		     (not (pred_3 ?v7))))


   (:action op_1
       :parameters (?v2 ?v3)
       :precondition  (and  (pred_2 ?v2) (pred_4 ?v3)
			    (pred_5 ?v2 ?v3) (pred_3 ?v3) (pred_1))
       :effect (and (pred_6 ?v2)
		    (not (pred_5 ?v2 ?v3)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v2  ?v3)
       :precondition  (and  (pred_2 ?v2) (pred_4 ?v3)
			    (pred_6 ?v2) (pred_3 ?v3))
       :effect (and (pred_5 ?v2 ?v3)
		    (pred_1)
		    (not (pred_6 ?v2)))))
