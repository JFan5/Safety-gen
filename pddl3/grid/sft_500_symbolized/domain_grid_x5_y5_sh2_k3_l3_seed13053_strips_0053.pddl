(define (domain grid)
(:requirements :strips :constraints)
(:predicates (pred_12 ?v2 ?v9)
             (pred_9 ?v5 ?v1)
             (pred_11 ?v2 ?v1)
             (pred_5 ?v3 ?v2 )
	     (pred_8 ?v2)
             (pred_7 ?v12)
             (pred_1 ?v5)
             (pred_4 ?v1)
             (pred_10 ?v2)
             (pred_3 ?v5)
             (pred_2 ?v2)
             (pred_6 ))



(:action op_2
:parameters (?v6 ?v13 ?v11 ?v10)
:precondition (and (pred_7 ?v6) (pred_7 ?v13) (pred_1 ?v11) (pred_4 ?v10)
          (pred_12 ?v6 ?v13) (pred_9 ?v11 ?v10)
                   (pred_11 ?v13 ?v10) (pred_8 ?v6) 
                   (pred_10 ?v13) (pred_3 ?v11))
:effect (and  (pred_2 ?v13) (not (pred_10 ?v13))))


(:action op_4
:parameters (?v6 ?v4)
:precondition (and (pred_7 ?v6) (pred_7 ?v4)
               (pred_8 ?v6) (pred_12 ?v6 ?v4) (pred_2 ?v4))
:effect (and (pred_8 ?v4) (not (pred_8 ?v6))))

(:action op_5
:parameters (?v6 ?v11)
:precondition (and (pred_7 ?v6) (pred_1 ?v11) 
                  (pred_8 ?v6) (pred_5 ?v11 ?v6) (pred_6 ))
:effect (and (pred_3 ?v11)
   (not (pred_5 ?v11 ?v6)) (not (pred_6 ))))


(:action op_3
:parameters (?v6 ?v7 ?v8)
:precondition (and (pred_7 ?v6) (pred_1 ?v7) (pred_1 ?v8)
                  (pred_8 ?v6) (pred_3 ?v8) (pred_5 ?v7 ?v6))
:effect (and (pred_3 ?v7) (pred_5 ?v8 ?v6)
        (not (pred_3 ?v8)) (not (pred_5 ?v7 ?v6))))

(:action op_1
:parameters (?v6 ?v11)
:precondition (and (pred_7 ?v6) (pred_1 ?v11) 
                  (pred_8 ?v6) (pred_3 ?v11))
:effect (and (pred_6 ) (pred_5 ?v11 ?v6) (not (pred_3 ?v11)))))


	
