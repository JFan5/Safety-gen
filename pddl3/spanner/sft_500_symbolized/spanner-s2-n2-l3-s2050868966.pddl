; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 2050868966 --problem-name spanner-s2-n2-l3-s2050868966
(define (problem spanner-s2-n2-l3-s2050868966)
 (:domain spanner)
 (:objects 
     obj_04 - type_4
     obj_10 obj_09 - type_2
     obj_02 obj_05 - type_5
     obj_06 obj_07 obj_03 - type_3
     obj_01 obj_08 - type_3
    )
 (:init 
    (pred_4 obj_04 obj_01)
    (pred_4 obj_10 obj_07)
    (pred_1 obj_10)
    (pred_4 obj_09 obj_07)
    (pred_1 obj_09)
    (pred_6 obj_02)
    (pred_4 obj_02 obj_08)
    (pred_6 obj_05)
    (pred_4 obj_05 obj_08)
    (pred_3 obj_01 obj_06)
    (pred_3 obj_03 obj_08)
    (pred_3 obj_06 obj_07)
    (pred_3 obj_07 obj_03)
)
 (:goal
  (and
   (pred_2 obj_02)
   (pred_2 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_2 obj_02)) (not (pred_2 obj_05))))
    (forall (?m - type_4) (at-most-once (pred_4 ?m obj_01)))
  )
)
)
