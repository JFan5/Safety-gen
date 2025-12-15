(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_05 - type_2
obj_06 obj_02 - type_3
obj_09 obj_07 obj_01 - type_1
obj_08 obj_04 obj_03 - object)
(:init
(pred_2 obj_05 obj_09)
(pred_1 obj_05 obj_06)
(pred_1 obj_05 obj_02)
(pred_4 obj_08 obj_09)
(pred_4 obj_04 obj_01)
(pred_4 obj_03 obj_07)
)
(:goal
(and
(pred_4 obj_08 obj_01)
(pred_4 obj_04 obj_09)
(pred_4 obj_03 obj_07)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_05 ?b obj_02))))
)
)