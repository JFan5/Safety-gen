; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1391191620 --problem-name spanner-s3-n2-l4-s1391191620
(define (problem spanner-s3-n2-l4-s1391191620)
 (:domain spanner)
 (:objects 
     obj_02 - type_4
     obj_05 obj_11 obj_08 - type_2
     obj_01 obj_12 - type_5
     obj_10 obj_07 obj_09 obj_06 - type_1
     obj_04 obj_03 - type_1
    )
 (:init 
    (pred_3 obj_02 obj_04)
    (pred_3 obj_05 obj_06)
    (pred_2 obj_05)
    (pred_3 obj_11 obj_09)
    (pred_2 obj_11)
    (pred_3 obj_08 obj_06)
    (pred_2 obj_08)
    (pred_4 obj_01)
    (pred_3 obj_01 obj_03)
    (pred_4 obj_12)
    (pred_3 obj_12 obj_03)
    (pred_1 obj_04 obj_10)
    (pred_1 obj_06 obj_03)
    (pred_1 obj_10 obj_07)
    (pred_1 obj_07 obj_09)
    (pred_1 obj_09 obj_06)
)
 (:goal
  (and
   (pred_5 obj_01)
   (pred_5 obj_12)
))
(:constraints
  (and
    (always (imply (not (pred_5 obj_01)) (not (pred_5 obj_12))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_04)))
  )
)
)
