; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 247445534 --problem-name spanner-s2-n2-l3-s247445534
(define (problem spanner-s2-n2-l3-s247445534)
 (:domain spanner)
 (:objects 
     obj_05 - type_2
     obj_09 obj_08 - type_5
     obj_10 obj_06 - type_3
     obj_04 obj_03 obj_02 - type_1
     obj_01 obj_07 - type_1
    )
 (:init 
    (pred_2 obj_05 obj_01)
    (pred_2 obj_09 obj_03)
    (pred_5 obj_09)
    (pred_2 obj_08 obj_04)
    (pred_5 obj_08)
    (pred_1 obj_10)
    (pred_2 obj_10 obj_07)
    (pred_1 obj_06)
    (pred_2 obj_06 obj_07)
    (pred_6 obj_01 obj_04)
    (pred_6 obj_02 obj_07)
    (pred_6 obj_04 obj_03)
    (pred_6 obj_03 obj_02)
)
 (:goal
  (and
   (pred_3 obj_10)
   (pred_3 obj_06)
))
(:constraints
  (and
    (always (imply (not (pred_3 obj_10)) (not (pred_3 obj_06))))
    (forall (?m - type_2) (at-most-once (pred_2 ?m obj_01)))
  )
)
)
