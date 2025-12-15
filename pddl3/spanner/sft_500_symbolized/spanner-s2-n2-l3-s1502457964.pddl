; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 1502457964 --problem-name spanner-s2-n2-l3-s1502457964
(define (problem spanner-s2-n2-l3-s1502457964)
 (:domain spanner)
 (:objects 
     obj_02 - type_3
     obj_09 obj_08 - type_5
     obj_01 obj_03 - type_2
     obj_07 obj_04 obj_06 - type_1
     obj_10 obj_05 - type_1
    )
 (:init 
    (pred_2 obj_02 obj_10)
    (pred_2 obj_09 obj_07)
    (pred_1 obj_09)
    (pred_2 obj_08 obj_06)
    (pred_1 obj_08)
    (pred_4 obj_01)
    (pred_2 obj_01 obj_05)
    (pred_4 obj_03)
    (pred_2 obj_03 obj_05)
    (pred_5 obj_10 obj_07)
    (pred_5 obj_06 obj_05)
    (pred_5 obj_07 obj_04)
    (pred_5 obj_04 obj_06)
)
 (:goal
  (and
   (pred_6 obj_01)
   (pred_6 obj_03)
))
(:constraints
  (and
    (always (imply (not (pred_6 obj_01)) (not (pred_6 obj_03))))
    (forall (?m - type_3) (at-most-once (pred_2 ?m obj_10)))
  )
)
)
