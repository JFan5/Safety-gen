(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_09 - type_3
obj_02 obj_10 obj_12 obj_04 - type_2
obj_07 obj_08 obj_05 obj_13 - type_1
obj_06 obj_01 obj_03 - object)
(:init
(pred_1 obj_11 obj_08)
(pred_2 obj_11 obj_02)
(pred_2 obj_11 obj_10)
(pred_1 obj_09 obj_05)
(pred_2 obj_09 obj_12)
(pred_2 obj_09 obj_04)
(pred_4 obj_06 obj_13)
(pred_4 obj_01 obj_07)
(pred_4 obj_03 obj_08)
)
(:goal
(and
(pred_4 obj_06 obj_07)
(pred_4 obj_01 obj_13)
(pred_4 obj_03 obj_08)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_11 obj_07) (pred_1 obj_09 obj_07))))
    (always (not (and (pred_1 obj_11 obj_13) (pred_1 obj_09 obj_13))))
  )
)
)