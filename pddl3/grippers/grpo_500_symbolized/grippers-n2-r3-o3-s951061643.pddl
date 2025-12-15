(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_11 - type_1
obj_08 obj_03 obj_01 obj_12 - type_3
obj_07 obj_04 obj_10 - type_2
obj_09 obj_05 obj_06 - object)
(:init
(pred_3 obj_02 obj_10)
(pred_4 obj_02 obj_08)
(pred_4 obj_02 obj_03)
(pred_3 obj_11 obj_04)
(pred_4 obj_11 obj_01)
(pred_4 obj_11 obj_12)
(pred_2 obj_09 obj_10)
(pred_2 obj_05 obj_04)
(pred_2 obj_06 obj_04)
)
(:goal
(and
(pred_2 obj_09 obj_10)
(pred_2 obj_05 obj_04)
(pred_2 obj_06 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_02 obj_10) (pred_3 obj_11 obj_10))))
  )
)
)