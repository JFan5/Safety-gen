; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 3 2 4 --seed 1606389027 --problem-name spanner-s3-n2-l4-s1606389027
(define (problem spanner-s3-n2-l4-s1606389027)
 (:domain spanner)
 (:objects 
     obj_12 - type_4
     obj_04 obj_06 obj_05 - type_5
     obj_01 obj_02 - type_1
     obj_03 obj_07 obj_08 obj_11 - type_3
     obj_09 obj_10 - type_3
    )
 (:init 
    (pred_3 obj_12 obj_09)
    (pred_3 obj_04 obj_03)
    (pred_1 obj_04)
    (pred_3 obj_06 obj_07)
    (pred_1 obj_06)
    (pred_3 obj_05 obj_08)
    (pred_1 obj_05)
    (pred_5 obj_01)
    (pred_3 obj_01 obj_10)
    (pred_5 obj_02)
    (pred_3 obj_02 obj_10)
    (pred_4 obj_09 obj_03)
    (pred_4 obj_11 obj_10)
    (pred_4 obj_03 obj_07)
    (pred_4 obj_07 obj_08)
    (pred_4 obj_08 obj_11)
)
 (:goal
  (and
   (pred_2 obj_01)
   (pred_2 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_01)) (not (pred_2 obj_02))))
    (forall (?m - type_4) (at-most-once (pred_3 ?m obj_09)))
  )
)
)
