(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_04 - type_1
obj_07 obj_06 obj_09 obj_03 - type_2
obj_08 obj_01 obj_10 - type_3
obj_11 obj_05 obj_12 - object)
(:init
(pred_1 obj_02 obj_08)
(pred_3 obj_02 obj_07)
(pred_3 obj_02 obj_06)
(pred_1 obj_04 obj_01)
(pred_3 obj_04 obj_09)
(pred_3 obj_04 obj_03)
(pred_2 obj_11 obj_01)
(pred_2 obj_05 obj_08)
(pred_2 obj_12 obj_08)
)
(:goal
(and
(pred_2 obj_11 obj_01)
(pred_2 obj_05 obj_01)
(pred_2 obj_12 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_02 obj_01) (pred_1 obj_04 obj_01))))
  )
)
)