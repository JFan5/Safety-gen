(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_04 obj_02 - type_3
obj_06 obj_09 obj_01 - type_2
obj_03 obj_07 obj_08 - object)
(:init
(pred_2 obj_05 obj_09)
(pred_4 obj_05 obj_04)
(pred_4 obj_05 obj_02)
(pred_1 obj_03 obj_06)
(pred_1 obj_07 obj_09)
(pred_1 obj_08 obj_09)
)
(:goal
(and
(pred_1 obj_03 obj_09)
(pred_1 obj_07 obj_06)
(pred_1 obj_08 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_05 ?b obj_02))))
)
)