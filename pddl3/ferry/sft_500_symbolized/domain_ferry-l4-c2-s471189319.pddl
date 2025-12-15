(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v6)
		(pred_2 ?v1)
		(pred_3 ?v5)
		(pred_4 ?v5)
		(pred_1 ?v1 ?v5)
		(pred_5)
		(pred_6 ?v1))

   (:action op_1
       :parameters  (?v7 ?v3)
       :precondition (and (not-eq ?v7 ?v3) 
                          (pred_3 ?v7) (pred_3 ?v3) (pred_4 ?v7))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v7))))


   (:action op_2
       :parameters (?v4 ?v8)
       :precondition  (and  (pred_2 ?v4) (pred_3 ?v8)
			    (pred_1 ?v4 ?v8) (pred_4 ?v8) (pred_5))
       :effect (and (pred_6 ?v4)
		    (not (pred_1 ?v4 ?v8)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v4  ?v8)
       :precondition  (and  (pred_2 ?v4) (pred_3 ?v8)
			    (pred_6 ?v4) (pred_4 ?v8))
       :effect (and (pred_1 ?v4 ?v8)
		    (pred_5)
		    (not (pred_6 ?v4)))))
