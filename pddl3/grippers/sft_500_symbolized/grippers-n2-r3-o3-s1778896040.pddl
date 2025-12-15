(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_03 - type_1
obj_09 obj_04 obj_05 obj_07 - type_3
obj_01 obj_10 obj_06 - type_2
obj_02 obj_12 obj_11 - object)
(:init
(pred_3 obj_08 obj_01)
(pred_1 obj_08 obj_09)
(pred_1 obj_08 obj_04)
(pred_3 obj_03 obj_10)
(pred_1 obj_03 obj_05)
(pred_1 obj_03 obj_07)
(pred_4 obj_02 obj_10)
(pred_4 obj_12 obj_06)
(pred_4 obj_11 obj_01)
)
(:goal
(and
(pred_4 obj_02 obj_01)
(pred_4 obj_12 obj_01)
(pred_4 obj_11 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_08 obj_01) (pred_3 obj_03 obj_01))))
  )
)
)