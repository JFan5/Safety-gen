(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_06 obj_12 - type_2
obj_07 obj_04 obj_05 obj_13 - type_1
obj_10 obj_11 obj_01 obj_08 - type_3
obj_03 obj_09 obj_02 - object)
(:init
(pred_1 obj_06 obj_11)
(pred_4 obj_06 obj_07)
(pred_4 obj_06 obj_04)
(pred_1 obj_12 obj_08)
(pred_4 obj_12 obj_05)
(pred_4 obj_12 obj_13)
(pred_3 obj_03 obj_01)
(pred_3 obj_09 obj_10)
(pred_3 obj_02 obj_01)
)
(:goal
(and
(pred_3 obj_03 obj_11)
(pred_3 obj_09 obj_11)
(pred_3 obj_02 obj_01)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_06 obj_11) (pred_1 obj_12 obj_11))))
    (always (not (and (pred_1 obj_06 obj_01) (pred_1 obj_12 obj_01))))
  )
)
)