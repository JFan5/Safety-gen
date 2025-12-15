(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_06 - type_3
obj_05 obj_08 obj_11 obj_03 - type_2
obj_01 obj_14 obj_07 obj_13 - type_1
obj_02 obj_09 obj_12 obj_04 - object)
(:init
(pred_1 obj_10 obj_14)
(pred_3 obj_10 obj_05)
(pred_3 obj_10 obj_08)
(pred_1 obj_06 obj_13)
(pred_3 obj_06 obj_11)
(pred_3 obj_06 obj_03)
(pred_4 obj_02 obj_07)
(pred_4 obj_09 obj_14)
(pred_4 obj_12 obj_14)
(pred_4 obj_04 obj_13)
)
(:goal
(and
(pred_4 obj_02 obj_07)
(pred_4 obj_09 obj_01)
(pred_4 obj_12 obj_13)
(pred_4 obj_04 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_10 obj_13) (pred_1 obj_06 obj_13))))
  )
)
)