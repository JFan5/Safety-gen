(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_09 obj_04 - type_3
obj_01 obj_07 obj_06 obj_11 - type_2
obj_05 obj_12 obj_03 obj_13 - type_1
obj_10 obj_08 obj_02 - object)
(:init
(pred_4 obj_09 obj_05)
(pred_3 obj_09 obj_01)
(pred_3 obj_09 obj_07)
(pred_4 obj_04 obj_12)
(pred_3 obj_04 obj_06)
(pred_3 obj_04 obj_11)
(pred_1 obj_10 obj_05)
(pred_1 obj_08 obj_03)
(pred_1 obj_02 obj_05)
)
(:goal
(and
(pred_1 obj_10 obj_13)
(pred_1 obj_08 obj_13)
(pred_1 obj_02 obj_03)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_09 obj_03) (pred_4 obj_04 obj_03))))
    (always (not (and (pred_4 obj_09 obj_13) (pred_4 obj_04 obj_13))))
  )
)
)