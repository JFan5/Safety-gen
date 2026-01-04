; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 603921898 --problem-name spanner-s2-n2-l3-s603921898
(define (problem spanner-s2-n2-l3-s603921898)
 (:domain spanner)
 (:objects 
     obj_06 - type_5
     obj_07 obj_03 - type_1
     obj_09 obj_02 - type_4
     obj_05 obj_10 obj_04 - type_3
     obj_01 obj_08 - type_3
    )
 (:init 
    (pred_2 obj_06 obj_01)
    (pred_2 obj_07 obj_04)
    (pred_5 obj_07)
    (pred_2 obj_03 obj_05)
    (pred_5 obj_03)
    (pred_3 obj_09)
    (pred_2 obj_09 obj_08)
    (pred_3 obj_02)
    (pred_2 obj_02 obj_08)
    (pred_1 obj_01 obj_05)
    (pred_1 obj_04 obj_08)
    (pred_1 obj_05 obj_10)
    (pred_1 obj_10 obj_04)
)
 (:goal
  (and
   (pred_6 obj_09)
   (pred_6 obj_02)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_09)) (not (pred_6 obj_02))))
    (forall (?m - type_5) (at-most-once (pred_2 ?m obj_01)))
  )
)
)
