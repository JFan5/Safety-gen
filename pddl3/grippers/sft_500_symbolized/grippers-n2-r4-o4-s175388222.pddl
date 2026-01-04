(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_02 - type_2
obj_04 obj_05 obj_07 obj_01 - type_1
obj_12 obj_14 obj_13 obj_11 - type_3
obj_03 obj_06 obj_08 obj_10 - object)
(:init
(pred_3 obj_09 obj_14)
(pred_1 obj_09 obj_04)
(pred_1 obj_09 obj_05)
(pred_3 obj_02 obj_11)
(pred_1 obj_02 obj_07)
(pred_1 obj_02 obj_01)
(pred_4 obj_03 obj_11)
(pred_4 obj_06 obj_11)
(pred_4 obj_08 obj_12)
(pred_4 obj_10 obj_13)
)
(:goal
(and
(pred_4 obj_03 obj_11)
(pred_4 obj_06 obj_13)
(pred_4 obj_08 obj_12)
(pred_4 obj_10 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_09 obj_13) (pred_3 obj_02 obj_13))))
  )
)
)