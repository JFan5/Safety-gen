(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_09 - type_1
obj_03 obj_11 obj_12 obj_01 - type_2
obj_07 obj_08 obj_05 - type_3
obj_04 obj_02 obj_10 - object)
(:init
(pred_1 obj_06 obj_07)
(pred_3 obj_06 obj_03)
(pred_3 obj_06 obj_11)
(pred_1 obj_09 obj_08)
(pred_3 obj_09 obj_12)
(pred_3 obj_09 obj_01)
(pred_2 obj_04 obj_08)
(pred_2 obj_02 obj_08)
(pred_2 obj_10 obj_07)
)
(:goal
(and
(pred_2 obj_04 obj_07)
(pred_2 obj_02 obj_08)
(pred_2 obj_10 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_06 obj_07) (pred_1 obj_09 obj_07))))
  )
)
)