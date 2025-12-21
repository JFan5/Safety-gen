(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v4)
		(pred_6 ?v5)
		(pred_4 ?v3)
		(pred_1 ?v3)
		(pred_2 ?v5 ?v3)
		(pred_5)
		(pred_3 ?v5))

   (:action op_2
       :parameters  (?v8 ?v6)
       :precondition (and (not-eq ?v8 ?v6) 
                          (pred_4 ?v8) (pred_4 ?v6) (pred_1 ?v8))
       :effect (and  (pred_1 ?v6)
		     (not (pred_1 ?v8))))


   (:action op_1
       :parameters (?v1 ?v7)
       :precondition  (and  (pred_6 ?v1) (pred_4 ?v7)
			    (pred_2 ?v1 ?v7) (pred_1 ?v7) (pred_5))
       :effect (and (pred_3 ?v1)
		    (not (pred_2 ?v1 ?v7)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v1  ?v7)
       :precondition  (and  (pred_6 ?v1) (pred_4 ?v7)
			    (pred_3 ?v1) (pred_1 ?v7))
       :effect (and (pred_2 ?v1 ?v7)
		    (pred_5)
		    (not (pred_3 ?v1)))))
