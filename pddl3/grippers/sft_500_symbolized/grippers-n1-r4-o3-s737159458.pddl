(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_01 - type_1
obj_10 obj_02 - type_3
obj_07 obj_04 obj_03 obj_09 - type_2
obj_06 obj_08 obj_05 - object)
(:init
(pred_1 obj_01 obj_09)
(pred_4 obj_01 obj_10)
(pred_4 obj_01 obj_02)
(pred_3 obj_06 obj_03)
(pred_3 obj_08 obj_04)
(pred_3 obj_05 obj_09)
)
(:goal
(and
(pred_3 obj_06 obj_04)
(pred_3 obj_08 obj_04)
(pred_3 obj_05 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_01 ?b obj_02))))
)
)