; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1502457964 --problem-name spanner-s2-n2-l3-s1502457964
(define (problem spanner-s2-n2-l3-s1502457964)
 (:domain spanner)
 (:objects 
     obj_04 - type_5
     obj_08 obj_01 - type_3
     obj_02 obj_10 - type_2
     obj_09 obj_05 obj_03 - type_1
     obj_06 obj_07 - type_1
    )
 (:init 
    (pred_5 obj_04 obj_06)
    (pred_5 obj_08 obj_09)
    (pred_4 obj_08)
    (pred_5 obj_01 obj_03)
    (pred_4 obj_01)
    (pred_3 obj_02)
    (pred_5 obj_02 obj_07)
    (pred_3 obj_10)
    (pred_5 obj_10 obj_07)
    (pred_2 obj_06 obj_09)
    (pred_2 obj_03 obj_07)
    (pred_2 obj_09 obj_05)
    (pred_2 obj_05 obj_03)
)
 (:goal
  (and
   (pred_1 obj_02)
   (pred_1 obj_10)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_02)) (not (pred_1 obj_10))))
    (forall (?m - type_5) (at-most-once (pred_5 ?m obj_06)))
  )
)
)
