(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_04 obj_02 - type_3
obj_08 obj_09 obj_01 - type_2
obj_05 obj_06 obj_07 - object)
(:init
(pred_2 obj_03 obj_01)
(pred_4 obj_03 obj_04)
(pred_4 obj_03 obj_02)
(pred_1 obj_05 obj_08)
(pred_1 obj_06 obj_08)
(pred_1 obj_07 obj_01)
)
(:goal
(and
(pred_1 obj_05 obj_01)
(pred_1 obj_06 obj_09)
(pred_1 obj_07 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_03 ?b obj_02))))
)
)