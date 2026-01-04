(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_02 - type_2
obj_10 obj_11 obj_07 obj_09 - type_3
obj_06 obj_08 obj_01 obj_03 - type_1
obj_13 obj_05 obj_12 - object)
(:init
(pred_4 obj_04 obj_01)
(pred_2 obj_04 obj_10)
(pred_2 obj_04 obj_11)
(pred_4 obj_02 obj_03)
(pred_2 obj_02 obj_07)
(pred_2 obj_02 obj_09)
(pred_1 obj_13 obj_01)
(pred_1 obj_05 obj_08)
(pred_1 obj_12 obj_03)
)
(:goal
(and
(pred_1 obj_13 obj_08)
(pred_1 obj_05 obj_08)
(pred_1 obj_12 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_04 obj_01) (pred_4 obj_02 obj_01))))
  )
)
)