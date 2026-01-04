; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1263051763 --problem-name spanner-s2-n2-l3-s1263051763
(define (problem spanner-s2-n2-l3-s1263051763)
 (:domain spanner)
 (:objects 
     obj_03 - type_4
     obj_08 obj_06 - type_2
     obj_04 obj_10 - type_3
     obj_07 obj_02 obj_05 - type_5
     obj_09 obj_01 - type_5
    )
 (:init 
    (pred_1 obj_03 obj_09)
    (pred_1 obj_08 obj_02)
    (pred_5 obj_08)
    (pred_1 obj_06 obj_05)
    (pred_5 obj_06)
    (pred_2 obj_04)
    (pred_1 obj_04 obj_01)
    (pred_2 obj_10)
    (pred_1 obj_10 obj_01)
    (pred_3 obj_09 obj_07)
    (pred_3 obj_05 obj_01)
    (pred_3 obj_07 obj_02)
    (pred_3 obj_02 obj_05)
)
 (:goal
  (and
   (pred_4 obj_04)
   (pred_4 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_4 obj_04)) (not (pred_4 obj_10))))
    (forall (?m - type_4) (at-most-once (pred_1 ?m obj_09)))
  )
)
)
