; params: python3 /home/fjl2401/Safety-gen/spanner/spanner-generator.py 2 2 3 --seed 324440695 --problem-name spanner-s2-n2-l3-s324440695
(define (problem spanner-s2-n2-l3-s324440695)
 (:domain spanner)
 (:objects 
     obj_02 - type_1
     obj_09 obj_08 - type_5
     obj_03 obj_05 - type_4
     obj_10 obj_06 obj_04 - type_3
     obj_07 obj_01 - type_3
    )
 (:init 
    (pred_3 obj_02 obj_07)
    (pred_3 obj_09 obj_10)
    (pred_5 obj_09)
    (pred_3 obj_08 obj_10)
    (pred_5 obj_08)
    (pred_4 obj_03)
    (pred_3 obj_03 obj_01)
    (pred_4 obj_05)
    (pred_3 obj_05 obj_01)
    (pred_2 obj_07 obj_10)
    (pred_2 obj_04 obj_01)
    (pred_2 obj_10 obj_06)
    (pred_2 obj_06 obj_04)
)
 (:goal
  (and
   (pred_1 obj_03)
   (pred_1 obj_05)
))
(:constraints
  (and
    (always (imply (not (pred_1 obj_03)) (not (pred_1 obj_05))))
    (forall (?m - type_1) (at-most-once (pred_3 ?m obj_07)))
  )
)
)
