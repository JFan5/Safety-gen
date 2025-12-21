(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v2)
		(pred_4 ?v4)
		(pred_6 ?v6)
		(pred_1 ?v6)
		(pred_2 ?v4 ?v6)
		(pred_5)
		(pred_3 ?v4))

   (:action op_2
       :parameters  (?v7 ?v5)
       :precondition (and (not-eq ?v7 ?v5) 
                          (pred_6 ?v7) (pred_6 ?v5) (pred_1 ?v7))
       :effect (and  (pred_1 ?v5)
		     (not (pred_1 ?v7))))


   (:action op_1
       :parameters (?v8 ?v1)
       :precondition  (and  (pred_4 ?v8) (pred_6 ?v1)
			    (pred_2 ?v8 ?v1) (pred_1 ?v1) (pred_5))
       :effect (and (pred_3 ?v8)
		    (not (pred_2 ?v8 ?v1)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v8  ?v1)
       :precondition  (and  (pred_4 ?v8) (pred_6 ?v1)
			    (pred_3 ?v8) (pred_1 ?v1))
       :effect (and (pred_2 ?v8 ?v1)
		    (pred_5)
		    (not (pred_3 ?v8)))))
