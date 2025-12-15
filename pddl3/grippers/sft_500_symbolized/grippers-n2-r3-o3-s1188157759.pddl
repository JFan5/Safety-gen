(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_06 - type_2
obj_08 obj_11 obj_12 obj_02 - type_1
obj_04 obj_10 obj_07 - type_3
obj_03 obj_05 obj_09 - object)
(:init
(pred_2 obj_01 obj_07)
(pred_1 obj_01 obj_08)
(pred_1 obj_01 obj_11)
(pred_2 obj_06 obj_10)
(pred_1 obj_06 obj_12)
(pred_1 obj_06 obj_02)
(pred_3 obj_03 obj_07)
(pred_3 obj_05 obj_07)
(pred_3 obj_09 obj_07)
)
(:goal
(and
(pred_3 obj_03 obj_10)
(pred_3 obj_05 obj_10)
(pred_3 obj_09 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_01 obj_07) (pred_2 obj_06 obj_07))))
  )
)
)